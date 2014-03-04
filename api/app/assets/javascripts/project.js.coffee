# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  _nodes = []
  # alert $('input[key=editable]').val()
  
  is_enable = (s) ->
    s == 'on' ? true : false
  
  is_expand_all = true #$('input[key=is_expand_all]')[0].checked
  
  # for ztree checkout 
  clearFlag = false;
  checked_count = ->
 	  zTree = $.fn.zTree.getZTreeObj("treeId")
 	  checkCount = zTree.getCheckedNodes(true).length
 	  nocheckCount = zTree.getCheckedNodes(false).length
 	  changeCount = zTree.getChangeCheckedNodes().length
 	  $("#checkCount").text(checkCount)
 	  $("#nocheckCount").text(nocheckCount)
 	  $("#changeCount").text(changeCount)
  clearCheckedOldNodes = ->
    zTree = $.fn.zTree.getZTreeObj("treeId")
    nodes = zTree.getChangeCheckedNodes
    node.checkedOld = node.checked for node in nodes
  
  # define settings 
  get_settings = ->
    editable      = $('input[key=editable]')[0].checked
    checkable     = $('input[key=checkable]')[0].checked
    is_show_icon  = $('input[key=is_show_icon]')[0].checked
    is_show_line  = $('input[key=is_show_line]')[0].checked
    is_show_title = $('input[key=is_show_title]')[0].checked
    is_expand_all = $('input[key=is_expand_all]')[0].checked
    
    setting =
      check:
      	enable: checkable
      edit:
      		enable: editable 
      		showRemoveBtn: true
      		showRenameBtn: true
      view:
        dblClickExpand: true
        selectedMulti: false
        showIcon: is_show_icon
        # showLine: is_show_line
        # showTitle: is_show_title 
      data:  
        simpleData: 
          enable:true
          idKey: "myid"
          pIdKey: "pid"
          rootPId: ""
      callback:
        beforeClick:(treeId, treeNode) ->
          zTree = $.fn.zTree.getZTreeObj("treeId")
          console.log treeNode
          if (treeNode.isParent)
            zTree.expandNode(treeNode)
            return false
          else  
            # alert treeNode.name
            $('.main_detail').html(treeNode.detail);
            return true 
        beforeDrag:(treeId, treeNodes) ->
          node.drag ? true : false for node in treeNodes
          console.log treeNodes
        beforeDrop: (treeId, treeNodes, targetNode, moveType) ->
          parent_id = targetNode.id
          current_id = treeNodes[0].id
          level = targetNode.level
        
          params =
            pid : parent_id 
            cid : current_id 
            move_type : moveType
            level  : level  
          
          $.get "/root/update_sections_relation.do", params,(status) ->
            console.log 'GET update_sections_relation ' + status.msg
                
          targetNode ? targetNode.drop != false : true
          console.log parent_id 
          console.log current_id 
        onRename: (e, treeId, targetNode) ->
          params =
            cid : targetNode.id  
            name : targetNode.name 
          
          $.get "/root/update_sections_name.do", params,(status) ->
            console.log 'GET update_sections_name ' + status.msg
        onCheck:(e, treeId, treeNode) ->
          checked_count()
          clearCheckedOldNodes() unless clearFlag
          	
   # _nodes,ztree_obj 
   
   $.getJSON "/root/get_tree.json", (nodes) ->
     _nodes = nodes
     settings = get_settings()
     ztree_obj = $.fn.zTree.init($('#treeId'), settings , nodes).expandAll(is_expand_all )

   $("input[type='checkbox']").change(()->
     # alert this.value if this.checked
     params =
       cid : $('.project_info').attr('project_id')
       key : $(this).attr('key')
       value : this.checked
     
     $.get "/project/update_config_with_pair.do", params,(status) ->
          console.log 'GET update_config_with_pair ' + status.msg
          
          settings = get_settings()
          
          $.fn.zTree.init($('#treeId'), settings  , _nodes).expandAll(is_expand_all )
     )
