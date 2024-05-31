RSpec.describe 'Dynamodb' do
  context '' do
    let(:ddb) do
      Aws::DynamoDB::Client.new(
        endpoint: 'http://localhost:8000',
        region: 'ap-northeast-1',
        access_key_id: 'xxxxx',
        secret_access_key: 'xxxxx'
      )
    end

    before do
      options = {
        table_name: 'access_logs',
        key_schema: [
          {
            attribute_name: 'user_id',
            key_type: 'HASH'
          },
          {
            attribute_name: 'timestamp',
            key_type: 'RANGE'
          }
        ],
        attribute_definitions: [
          {
            attribute_name: 'user_id',
            attribute_type: 'S'
          },
          {
            attribute_name: 'timestamp',
            attribute_type: 'N'
          }
        ],
        provisioned_throughput: {
          read_capacity_units: 1,
          write_capacity_units: 1
        }
      }
      ddb.create_table(options)
    end

    after do
      ddb.delete_table(table_name: 'access_logs')
    end

    it 'test' do
      result = ddb.list_tables
      expect(result.table_names.include?('access_logs')).to be_truthy
    end
  end
end
