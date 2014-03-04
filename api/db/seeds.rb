# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p = Project.create(name:'first project')
p2 = Project.create(name:'second project')

s1 = Section.create(name:'s1',detail:'ssssss11111',pid:1)
s1.project = p
s1.save
s2 = Section.create(name:'s2',detail:'ssssss22222',pid:1)
s2.project = p
s2.save

# p.sections = [s1,s2];
p.save


root = Section.create!(:name => '根节点')

u = Section.create! :name => '用户管理',detail:'ssssss用户管理', :parent => root
Section.create! :name => '商户管理',detail:'sds商户管理', :parent => root
Section.create! :name => '小区管理',detail:'小区管理', :parent => root
Section.create! :name => '书记管理',detail:'书记管理ssd', :parent => root


Section.create! :name => 'ssss', :parent => u
Section.create! :name => 'dddd', :parent => u
Section.create! :name => 'fff', :parent => u