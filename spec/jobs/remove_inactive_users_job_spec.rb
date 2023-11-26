# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoveInactiveUsersJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  it 'queues the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in default queue' do
    expect(RemoveInactiveUsersJob.new.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect(RemoveInactiveUsersService).to receive(:remove_inactive_users)
    perform_enqueued_jobs { job }
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
