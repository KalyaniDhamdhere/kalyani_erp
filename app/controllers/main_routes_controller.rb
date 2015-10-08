class MainRoutesController < ApplicationController


  before_action :set_main_route, only: [:show,:edit, :update, :destroy]
  # GET /main_routes
  # GET /main_routes.json
  def index
    @main_routes = MainRoute.all
    
  end
  def main_route_pdf
    @main_routes = MainRoute.all
      respond_to do |format|
      format.html
      format.pdf do
        pdf = MainRoutePdf.new(@main_routes,view_context)
        send_data pdf.render, filename: "main_route_pdf.pdf",type: "application/pdf",disposition: "inline"
      end
  end
end

  # GET /main_routes/1
  # GET /main_routes/1.json
  def show
     
      # format.csv { send_data @main_routes.to_csv }
      # format.xls
  
  end

  # GET /main_routes/new
  def new
    @main_route = MainRoute.new
  end

  # GET /main_routes/1/edit
  def edit
  end

  # POST /main_routes
  # POST /main_routes.json
  def create
    @main_route = MainRoute.new(main_route_params)

    respond_to do |format|
      if @main_route.save
        format.html { redirect_to @main_route, notice: 'Main route was successfully created.' }
        format.json { render :show, status: :created, location: @main_route }
      else
        format.html { render :new }
        format.json { render json: @main_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_routes/1
  # PATCH/PUT /main_routes/1.json
  def update
    respond_to do |format|
      if @main_route.update(main_route_params)
        format.html { redirect_to @main_route, notice: 'Main route was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_route }
      else
        format.html { render :edit }
        format.json { render json: @main_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_routes/1
  # DELETE /main_routes/1.json
  def destroy
    @main_route.destroy
    respond_to do |format|
      format.html { redirect_to main_routes_url, notice: 'Main route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_route
      @main_route = MainRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_route_params
      params.require(:main_route).permit(:route_name, :cost)
    end
end
