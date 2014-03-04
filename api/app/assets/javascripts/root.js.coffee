# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  
  tab_setting =
    fix_height : '200px'
    	
  
  $('.wrap1').i5ting_jquery_tab(tab_setting)
  
  nodes = [
    name: "父节点1"
    children: [
      name: 
        "子节点1"
      name: 
        "子节点2"
    ]
  ]

  setting =
    edit:
    		enable: false,
    		showRemoveBtn: true,
    		showRenameBtn: true
    view:
      dblClickExpand: true
      showLine: true
      selectedMulti: false
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
          $('.main').html(treeNode.detail);
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
        
   
   
   $.getJSON "/root/get_tree.json", (nodes) ->
     $.fn.zTree.init($('#treeId'), setting, nodes).expandAll(true)

