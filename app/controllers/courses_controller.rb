class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]
  before_action :join_course_catname, only: %i[index create]

  # GET /courses
  def index
    @courses = @joinedtable.where(
      'courses.created_by = ?', current_user
    )
    json_response(@courses)
  end

  # GET /courses/:id
  def show
    json_response(@course)
  end

  # POST /courses
  def create
    @cour = current_user.courses.create!(course_params)
    @course = @joinedtable.where(
      'courses.id = ?', @cour.id
    )
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

  def join_course_catname
    @joinedtable = CategoryName.joins(:courses).select('courses.id', 'courses.title', 'courses.created_by',
                                                       'courses.duration', 'category_names.name AS category')
  end
end
