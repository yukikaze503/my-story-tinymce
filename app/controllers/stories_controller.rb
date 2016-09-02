class StoriesController < ApplicationController
  before_action :require_login

  def index
    @stories = current_user.stories
    @story = Story.new
  end

  def new
    @story = Story.new
  end

  def create
    story = Story.new
    story.attributes = story_params.merge!(user_id: current_user.id)
    if story.save
      redirect_to stories_path
    else
      Rails.logger.debug "---------- #{user.errors.inspect}"
      render :new
    end
  end

  def edit
    @story = Story.find params[:id]
    redirect_to edit_story_path(story.id)
  end

  def show
    @story = Story.find params[:id]
  end

  def update
    story = Story.find params[:id]
    if story.update(story_params)
      redirect_to stories_path
    else
      render :index
    end
  end

  def destroy
    story = Story.find params[:id]
    story.destroy  # delete 和 destroy 有什么区别？
    redirect_to stories_path
  end

  private
  def story_params
    params.require[:story].permit(:title, :body, {avatar: []})
  end
end
