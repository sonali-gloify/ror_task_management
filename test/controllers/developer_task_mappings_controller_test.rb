require 'test_helper'

class DeveloperTaskMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @developer_task_mapping = developer_task_mappings(:one)
  end

  test "should get index" do
    get developer_task_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_developer_task_mapping_url
    assert_response :success
  end

  test "should create developer_task_mapping" do
    assert_difference('DeveloperTaskMapping.count') do
      post developer_task_mappings_url, params: { developer_task_mapping: { developer: @developer_task_mapping.developer, task: @developer_task_mapping.task } }
    end

    assert_redirected_to developer_task_mapping_url(DeveloperTaskMapping.last)
  end

  test "should show developer_task_mapping" do
    get developer_task_mapping_url(@developer_task_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_developer_task_mapping_url(@developer_task_mapping)
    assert_response :success
  end

  test "should update developer_task_mapping" do
    patch developer_task_mapping_url(@developer_task_mapping), params: { developer_task_mapping: { developer: @developer_task_mapping.developer, task: @developer_task_mapping.task } }
    assert_redirected_to developer_task_mapping_url(@developer_task_mapping)
  end

  test "should destroy developer_task_mapping" do
    assert_difference('DeveloperTaskMapping.count', -1) do
      delete developer_task_mapping_url(@developer_task_mapping)
    end

    assert_redirected_to developer_task_mappings_url
  end
end
