module TasksHelper
 def show_category_name (c)
   if ( !c )
     'Undefined'

   else
     c.name
   end
  end
end 
