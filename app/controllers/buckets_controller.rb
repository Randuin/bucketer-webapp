class BucketsController < ApplicationController
  def index
  end

  def steps
    p = params[:buckets]

    # NOTE: May be this to_i sanitization belongs on the gem side? Then again the front
    # end should take care of the inputs, further discussion needed
    @comparer = Bucketer::Comparer.new p[:bucket_a_size].to_i, p[:bucket_b_size].to_i, p[:target_size].to_i
    render json: @comparer.steps
  rescue => e
    render json: { reponse: 'error', message: e.message }
  end

  # TODO: One-off that doesn't really belong in this controller, consider refactoring elsewhere if this codebase ever expands
  def share
  end
end
