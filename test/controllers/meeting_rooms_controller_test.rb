require 'test_helper'

class MeetingRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting_room = meeting_rooms(:one)
  end

  test "should get index" do
    get meeting_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_meeting_room_url
    assert_response :success
  end

  test "should create meeting_room" do
    assert_difference('MeetingRoom.count') do
      post meeting_rooms_url, params: { meeting_room: {  } }
    end

    assert_redirected_to meeting_room_url(MeetingRoom.last)
  end

  test "should show meeting_room" do
    get meeting_room_url(@meeting_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_meeting_room_url(@meeting_room)
    assert_response :success
  end

  test "should update meeting_room" do
    patch meeting_room_url(@meeting_room), params: { meeting_room: {  } }
    assert_redirected_to meeting_room_url(@meeting_room)
  end

  test "should destroy meeting_room" do
    assert_difference('MeetingRoom.count', -1) do
      delete meeting_room_url(@meeting_room)
    end

    assert_redirected_to meeting_rooms_url
  end
end
