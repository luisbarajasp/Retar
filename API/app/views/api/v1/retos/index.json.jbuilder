json.ignore_nil! true
json.done @done_retos do |reto|
    json.except! reto, :game_id, :judge_id, :retador_id
    # json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.except! retado, :user_username
        json.user retado.user
    end
    if !reto.game.nil?
        json.game reto.game
    end
    if !reto.judge.nil?
        json.judge reto.judge
    end
end
json.accepted @accepted_retos do |reto|
    json.except! reto, :game_id, :judge_id, :retador_id
    # json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.except! retado, :user_username
        json.user retado.user
    end
    if !reto.game.nil?
        json.game reto.game
    end
    if !reto.judge.nil?
        json.judge reto.judge
    end
end
json.judging @judging_retos do |reto|
    json.except! reto, :game_id, :judge_id, :retador_id
    # json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.except! retado, :user_username
        json.user retado.user
    end
    if !reto.game.nil?
        json.game reto.game
    end
    if !reto.judge.nil?
        json.judge reto.judge
    end
end
# json.done @done_retos, partial: 'api/v1/retos/reto', as: :reto