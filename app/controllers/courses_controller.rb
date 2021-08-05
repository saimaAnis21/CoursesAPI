class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  # GET /courses
  def index
    @courses = current_user.courses
    json_response(@courses)
  end

  # GET /courses/:id
  def show
    json_response(@course)
  end

  # POST /courses
  def create
    @course = current_user.courses.create!(course_params)
    json_response(@course, :created)
  end

  # PUT /courses/:id
  def update
    @course.update(course_params)
    head :no_content
  end

  # DELETE /courses/:id
  def destroy
    @course.destroy
    head :no_content
  end

  private

  def course_params
    # permit params
    params.permit(:title, :duration, :category_name_id)
  end

  def set_course
    # @course = Course.find(params[:id])
    usercourses = current_user.courses
    @course = usercourses.find(params[:id])
  end
end