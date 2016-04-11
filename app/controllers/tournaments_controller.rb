class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "yoroshiku", password: "yoroshiku", except: [:show, :index]
  
  # GET /tournaments
  # GET /tournaments.json
  def index
    @cm = Tournament.find 1
    @tournaments = Tournament.where.not(id:1).sort{|g| g.created_at.to_i}
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    if @tournament.id == 1
      @games = @tournament.games.sort_by(&:id).reverse
    else
      @games = @tournament.games.sort_by(&:id)
    end
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    respond_to do |format|
      if @tournament.save
        Game.batch_create!(@tournament.id, params[:data_file].path) if params[:data_file]
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        Game.batch_create!(@tournament.id, params[:data_file].path) if params[:data_file]
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :time, :tournament_type, :rule, :url, :first, :second, :third)
    end
end
