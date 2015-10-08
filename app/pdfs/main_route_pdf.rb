class MainRoutePdf < Prawn::Document
	def initialize(main_route,view)
		super(top_margin: 70)
		@main_routes = main_route
		# route_name
		@view=view
		line_items
	end
	
	# def route_name
	# 	text "Route #{@main_route.route_name}",size: 30, style: :bold
	# end
	
	def line_items
		 move_down 20
		table rows	do
row(0).font_style= :bold
columns(1..3).align= :right
self.row_colors= ["DDDDDD","FFFFFF"]
self.header= true	
		end
	end

	def rows
		[["Route","Cost"]] + 
		@main_routes.map do |item|
			[item.route_name , cost(item.cost) ]
		end
	end
	def cost(num)
		@view.number_to_currency(num)
	end
 end
