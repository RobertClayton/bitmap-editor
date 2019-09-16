# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor do
  it 'returns when provided a file that does not exist' do
    expect(subject.run('not_a_real_file.txt')).to eq('please provide correct file')
  end
end
