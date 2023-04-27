class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy, :toggle_status ]

  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status] }, site_admin: :all

  layout "blog"

  # GET /blogs or /blogs.json
  def index
    @page_title = "My Portfolio Blog"
    @blogs = Blog.page(params[:page]).per(5)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords << " " << @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: "Post status has been updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      begin
        @blog = Blog.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to missing_url
      end
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
