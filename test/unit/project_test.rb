require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "create" do
    user = users(:one)
    
    title = "My Title"
    
    project = Project.create( :title => title, :originator => user )
    
    assert_equal title, project.title
    assert_equal user, project.originator
    
    assert_equal 1, project.updates.count
    assert_equal user, project.updates.last.author
    assert_match /originated/,project.updates.last.text
  end
  
  test "user joins project" do
    user = users(:one)
    project = projects(:one)

    assert_equal 0, project.users.count

    project.users << user
    
    assert_equal 1, project.users.count
    assert_equal user, project.users.last
  end
  
end
