$LOAD_PATH << '.'
require 'widgetmanager'
require 'singleton'

class Controller
    include Singleton

    def init_system
        a_few_widgets_for_lols

        puts(">>> Initiate the system...\n")
        @widget_manager = Widget_Manager.new
        @widget_manager.initialise_widgets
        puts(@widget_manager.get_widget_array_clone)
        puts
        puts(@widget_manager.get_widget_array_clone[0].name)
        puts(@widget_manager.get_widget_array_clone[0].to_s)
        puts(@widget_manager.get_widget_array_clone[0].to_hash)
        puts
        puts("get_widgets_as_name_hash")
        puts
        puts(@widget_manager.get_widgets_as_name_hash['widget1'])
        puts
        puts(@widget_manager.get_widgets_as_name_hash['widget10'])
        puts
        puts(@widget_manager.get_widgets_by_valueaud(8))
        puts(@widget_manager.get_widgets_by_valueaud(8).length)
        puts
        puts(@widget_manager.get_widgets_by_valueaud(8,9))
        puts(@widget_manager.get_widgets_by_valueaud(8,9).length)

        w = @widget_manager.get_widget_array_clone[0]
        w.name = "RACH"
        @widget_manager.update_widget(w)
        puts
        puts(@widget_manager.get_widget_array_clone[0])
    end

    def a_few_widgets_for_lols
        puts(">>> A few Widgets for LOLs...")
        # Instantiation
        widget1 = Widget.new(101,"Widget 1","A very useful widget",10,20,30,40,50.0)
        # Get public Instance variable.
        puts(widget1.name)
        # Get public Class variable
        puts(Widget.get_count)
        widget2 = Widget.new(102,"Widget 2","A more useful widget",100,200,300,400,500.0)
        puts(Widget.get_count)
        # Instantiate specialised Widget - SpecialisedWidget.
        widget3 = Specialised_Widget.new(103,"Sp.Widget 3","A specialised useful widget",1000,2000,3000,4000,5000.0,"specialised attribute value 1")
        # Get generalised public attribute.
        puts(widget3.name)
        # Get specialised public attribute.
        puts(widget3.specialised_attribute)
    end

end