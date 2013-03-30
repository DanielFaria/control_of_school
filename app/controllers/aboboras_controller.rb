class AboborasController < ApplicationController
  # GET /aboboras
  # GET /aboboras.json
  def index
    @aboboras = Abobora.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aboboras }
    end
  end

  # GET /aboboras/1
  # GET /aboboras/1.json
  def show
    @abobora = Abobora.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @abobora }
    end
  end

  # GET /aboboras/new
  # GET /aboboras/new.json
  def new
    @abobora = Abobora.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @abobora }
    end
  end

  # GET /aboboras/1/edit
  def edit
    @abobora = Abobora.find(params[:id])
  end

  # POST /aboboras
  # POST /aboboras.json
  def create
    @abobora = Abobora.new(params[:abobora])

    respond_to do |format|
      if @abobora.save
        format.html { redirect_to @abobora, notice: 'Abobora was successfully created.' }
        format.json { render json: @abobora, status: :created, location: @abobora }
      else
        format.html { render action: "new" }
        format.json { render json: @abobora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aboboras/1
  # PUT /aboboras/1.json
  def update
    @abobora = Abobora.find(params[:id])

    respond_to do |format|
      if @abobora.update_attributes(params[:abobora])
        format.html { redirect_to @abobora, notice: 'Abobora was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @abobora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aboboras/1
  # DELETE /aboboras/1.json
  def destroy
    @abobora = Abobora.find(params[:id])
    @abobora.destroy

    respond_to do |format|
      format.html { redirect_to aboboras_url }
      format.json { head :no_content }
    end
  end
end
