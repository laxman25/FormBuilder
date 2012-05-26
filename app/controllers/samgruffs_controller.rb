class SamgruffsController < ApplicationController
  

#
def index
#abcd= Response.where("test_id= ? and user_id =?",8,current_user)
#    raise abcd.inspect


    @graph = open_flash_chart_object(600,300,'/samgruffs/graph_code')
  end

  def graph_code
    abcd=10
    title = Title.new("MY TITLE") 
    bar = BarGlass.new
    bar.set_values([2,3,4,abcd,5,6,7,8,9])
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.add_element(bar)
    render :text => chart.to_s
  end

end
