describe 'Root API' do
  describe '[GET] /' do
    it 'renders root view' do
      get_resource '/'

      expect(json).to eq errors_helper 'PONG'
      expect(response.status).to eq 404
    end
  end
end
