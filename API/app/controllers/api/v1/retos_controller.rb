class Api::V1::RetosController < Api::V1::RestrictablesController
    def index
        @done_retos = current_user.done_retos
        @accepted_retos = current_user.accepted_retos.to_a
        @judging_retos = current_user.judging_retos

        render :index, status: :ok
    end

    def create
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def reto_params
        params.require(:reto).permit()
    end
end
