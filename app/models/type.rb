class Type < ApplicationRecord
  belongs_to :category
  belongs_to :parent, class_name: 'Type', optional: true, foreign_key: :category_id
  
  has_many :children, class_name: 'Type', dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  validate :noFather
  

  def noFather
    if self.type_id == self.id
        self.errors.add(:type_id, 'No puede ser su propio ID Type')
    end
  end
  
  def all_children
    childs_to_visit = children.to_a
    childs_to_return = []
    while childs_to_visit.present?
      current_node = childs_to_visit.shift
      childs_to_return << current_node.name
      childs_to_visit.concat(current_node.children)
    end
    childs_to_return
  end 


end
