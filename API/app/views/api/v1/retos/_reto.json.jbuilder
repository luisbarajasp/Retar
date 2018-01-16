json.(reto, :id, :description, :retador_pick, :maximum_to, :bet, :created_at, :updated_at)
json.retados reto.retados, partial: 'api/v1/retados/retado', as: :retado