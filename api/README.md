== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


## TODO 

project name:string summary:text

section title:string detail:text pid:integer done:boolean order:integer level:integer

## 各种坑gems

### ancestry
if use ancestry **arrange_serializable** method,should be do as this:

    gem 'ancestry', :git => "git://github.com/stefankroes/ancestry.git"

### ztree

	gem 'jquery-ztree-rails', :git => "git://github.com/i5ting/jquery-ztree-rails.git"


## 更新section直接的关系

判断是否是0level，然后判断移动类型

	# _consts.move: {
	# 	TYPE_INNER: "inner",
	# 	TYPE_PREV: "prev",
	# 	TYPE_NEXT: "next"
	# },
	def update_sections_relation
		target_node  = Section.find(params[:pid])
		current_node = Section.find(params[:cid])		
		
		if params[:level ].to_i == 0
			if params[:move_type ] == 'inner'
				puts 'level=0的时候，如果movetype是inner，则正常赋予target_node为父节点'
				current_node.parent = target_node
			else
				puts 'level=0的时候，如果movetype不是inner，无论哪种都必须置空'
				current_node.parent = nil			
			end
		else
			if params[:move_type ] == 'inner'
				current_node.parent = target_node
				puts 'level != 0的时候，如果movetype是inner，则正常赋予父节点'
			else
				current_node.parent = target_node.parent		
				puts 'level != 0的时候，如果movetype不是inner，无论哪种父节点是'
			end
		end
		
		if current_node.save!
			render json: {:code => 0, :msg => 'success'}, status: :created
		else
			render json: {:code => 1, :msg => 'error'}, status: :created
		end
		
	end
	
	
## dynamic attr

	current_project = Project.find(params[:cid])		

	current_project.__send__ "#{params[:key]}=" , true
	
	
	
## 跨域

使用gem

	gem 'rack-cors', require: 'rack/cors'


在application.rb


	config.middleware.use Rack::Cors do
	  allow do
	    origins '*'
	    resource '/*', headers: :any, methods: [:get, :post, :put, :delete]
	  end
	end



