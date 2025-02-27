class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    @waiting_on = @list_of_deliveries.where({ :status => "waiting_on" })

    @received = @list_of_deliveries.where({ :status => "received" })

    render({ :template => "deliveries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show.html.erb" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.content = params.fetch("query_content")
    the_delivery.status = params.fetch("query_status")
    the_delivery.user_id = params.fetch("query_user_id")
    the_delivery.arrival = params.fetch("query_arrival")
    the_delivery.details = params.fetch("query_details")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { :notice => "Added to list" })
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.content = params.fetch("query_content")
    the_delivery.status = params.fetch("query_status")
    the_delivery.user_id = params.fetch("query_user_id")
    the_delivery.arrival = params.fetch("query_arrival")
    the_delivery.details = params.fetch("query_details")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { notice: "Delivery updated successfully"} )
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/", { :notice => "Delivery deleted successfully."} )
  end
end
