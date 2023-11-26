# frozen_string_literal: true

require 'sidekiq/testing'

Sidekiq::Testing.fake!

RSpec.describe 'Sidekiq job' do
  before do
    Sidekiq::Worker.clear_all
  end

  it 'is in the queue' do
    expect { RemoveInactiveUsersSidekiqJob.perform_async }.to change(RemoveInactiveUsersSidekiqJob.jobs, :size).by(1)
  end

  it 'is executed' do
    RemoveInactiveUsersSidekiqJob.perform_async
    RemoveInactiveUsersSidekiqJob.drain
    assert_equal 0, RemoveInactiveUsersSidekiqJob.jobs.size
  end
end
