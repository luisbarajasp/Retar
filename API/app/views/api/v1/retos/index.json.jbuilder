json.done @done_retos do |reto|
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
json.answered do
    json.array! @answered_retos do |reto|
        json.reto reto
        json.retados reto.retados
        json.game reto.game
    end
end
json.judging do
    json.array! @judging_retos do |reto|
        json.reto reto
        json.retados reto.retados
    end
end
# json.done @done_retos, partial: 'api/v1/retos/reto', as: :reto