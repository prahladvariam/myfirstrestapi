module Api
    module V1
        class DatainsertController < ApplicationController
            def index
                datainserts = Datainsert.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded data', data: datainserts},status: :ok
            end

            def show
                datainsert = Datainsert.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded data', data: datainsert},status: :ok
            end

            def create
                datainsert = Datainsert.new(datainsert_params)

                if datainsert.save
                    render json: {status: 'SUCCESS', message: 'Saved data', data: datainsert},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Data not saved', data: datainsert.errors},status: :unprocessable_entity
                end
            end

            def destroy
                datainsert = Datainsert.find(params[:id])
                datainsert.destroy
                render json: {status: 'SUCCESS', message: 'Data deleted', data: datainsert},status: :ok
            end

            def update
                datainsert = Datainsert.find(params[:id])
                if datainsert.update(datainsert_params)
                    render json: {status: 'SUCCESS', message: 'Data updated', data: datainsert},status: :ok
                else
                    render json: {status: 'ERROR', message: 'data not updated', data: datainsert.errors},status: :unprocessable_entity
                end
            end

            # This is a single line comment.
            private
            
            
            def datainsert_params
                params.permit(:title , :body)
            end
        end
    end
end    
