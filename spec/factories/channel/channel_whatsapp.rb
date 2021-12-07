FactoryBot.define do
  factory :channel_whatsapp, class: 'Channel::Whatsapp' do
    sequence(:phone_number) { |n| "+123456789#{n}1" }
    account
    provider_config { { 'api_key' => 'test_key' } }
    message_templates do
      [{ 'name' => 'sample_shipping_confirmation',
         'status' => 'approved',
         'category' => 'SHIPPING_UPDATE',
         'language' => 'id',
         'namespace' => '2342384942_32423423_23423fdsdaf',
         'components' =>
                            [{ 'text' => 'Paket Anda sudah dikirim. Paket akan sampai dalam {{1}} hari kerja.', 'type' => 'BODY' },
                             { 'text' => 'Pesan ini berasal dari bisnis yang tidak terverifikasi.', 'type' => 'FOOTER' }],
         'rejected_reason' => 'NONE' },
       { 'name' => 'sample_shipping_confirmation',
         'status' => 'approved',
         'category' => 'SHIPPING_UPDATE',
         'language' => 'en_US',
         'namespace' => '23423423_2342423_324234234_2343224',
         'components' =>
         [{ 'text' => 'Your package has been shipped. It will be delivered in {{1}} business days.', 'type' => 'BODY' },
          { 'text' => 'This message is from an unverified business.', 'type' => 'FOOTER' }],
         'rejected_reason' => 'NONE' }]
    end
    message_templates_last_updated { Time.now.utc }

    after(:create) do |channel_whatsapp|
      create(:inbox, channel: channel_whatsapp, account: channel_whatsapp.account)
    end
  end
end
