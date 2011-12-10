class BucketsController < ApplicationController
  def index
  end

  def steps
    p = params[:buckets]
    @comparer = Bucketer::Comparer.new p[:bucket_a_size].to_i, p[:bucket_b_size].to_i, p[:target_size].to_i
    render json: @comparer.steps
  rescue => e
    render json: { reponse: 'error', message: e.message }
  end
end
