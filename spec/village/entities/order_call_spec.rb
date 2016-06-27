require 'spec_helper'

describe OrderCall do
  it 'can be initialised with attributes' do
    book = OrderCall.new(
      name: 'Fedor Emelyanenko',
      phone: '+7-921-111-22-33',
      comment: 'Please, call me'
    )
    book.name.must_equal 'Fedor Emelyanenko'
    book.phone.must_equal '+7-921-111-22-33'
    book.comment.must_equal 'Please, call me'
  end
end
