json.ignore_nil! true
json.done @done_retos do |reto|
    # json.except! reto, :game_id, :judge_id, :retador_id
    json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.retado retado
        json.user retado.user
    end
    if !reto.game_id.nil?
        json.game reto.game
    end
    if !reto.judge_id.nil?
        json.judge reto.judge
    end
end
json.answered @answered_retos do |reto|
    # json.except! reto, :game_id, :judge_id, :retador_id
    json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.retado retado
        json.user retado.user
    end
    if !reto.game_id.nil?
        json.game reto.game
    end
    if !reto.judge_id.nil?
        json.judge reto.judge
    end
end
json.judging @judging_retos do |reto|
    # json.except! reto, :game_id, :judge_id, :retador_id
    json.reto reto
    json.retador reto.retador
    json.retados reto.retados do |retado|
        json.retado retado
        json.user retado.user
    end
    if !reto.game_id.nil?
        json.game reto.game
    end
    if !reto.judge_id.nil?
        json.judge reto.judge
    end
end
# json.done @done_retos, partial: 'api/v1/retos/reto', as: :reto