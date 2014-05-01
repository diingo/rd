class GamesController < ApplicationController
  def new
  end

  def create
    # remove blank player names
    players = params[:players].reject! { |p_name| p_name.empty? }
    result = RabbitDice::CreateGame.run(params)
    # binding.pry
    if result.success?
      flash[:success] = "You have successfully created a new game"
      redirect_to "/games/#{result.game.id}"
    else
      render 'new'
    end

  end

  def update
    @game = RabbitDice.db.get_game(params[:id].to_i)
    # binding.pry
    params[:game_id] = @game.id
    result = RabbitDice::PlayMove.run(params)

    if result.success?
    else
      flash[:error] = result.error

    end
    redirect_to "/games/#{@game.id}"
  end

  def show
    # binding.pry
    @game = RabbitDice.db.get_game(params[:id].to_i)
    @current_turn = @game.turns.last
    @current_turn_rolls = @current_turn.rolls
    flash[:success]
    flash[:error]
  end

  def delete
  end
end
