class TodoList
    def initialize (arr)
     @arr=arr
    end

  def get_items
    @arr
  end
  
  def add_item (item)
   @arr << item
  end

  def delete_item (item)
     idx=0
      while idx < @arr.length
        if @arr[idx] ==item
         @arr.delete_at(idx)
        end
        idx+=1
      end
   return @arr
  end

  def get_item (idx)
    @arr[idx]
  end
end