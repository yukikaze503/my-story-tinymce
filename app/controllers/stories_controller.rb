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
    story = Story.new(story_params)
    story.attributes = story_params.merge!(user_id: current_user.id)
    if story.save
      flash[:notice] = "创建成功"
      redirect_to stories_path
    else
      render :new
    end
  end

  def edit
    @story = Story.find params[:id]
  end

  def show
    @story = Story.find params[:id]
  end

  def update
    story = Story.find params[:id]
    if story.update(story_params)
      flash[:notice] = "修改成功"
      redirect_to stories_path
    else
      render :index
    end
  end

  def destroy
    story = Story.find params[:id]
    story.destroy  # delete 和 destroy 有什么区别？
    flash[:notice] = "删除成功"
    redirect_to stories_path
  end

  private
  def story_params
    params[:story].permit(:title, :body, {avatar: []})
  end
end
