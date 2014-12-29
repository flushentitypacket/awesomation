describe WemoSwitch do
  describe '#turn_on!' do
    before do
      @switch = create :wemo_switch
      allow(@switch).to receive(:get_state)
    end
    it 'turns on when off' do
      allow(@switch).to receive(:is_off?).and_return(true)
      expect(@switch).to receive(:set_state!).with('1')
      @switch.turn_on!
    end

    it 'does not turn on when on' do
      allow(@switch).to receive(:is_on?).and_return(true)
      expect(@switch).not_to receive(:set_state!)
      @switch.turn_on!
    end
  end
  describe '#turn_off!' do
    before do
      @switch = create :wemo_switch
      allow(@switch).to receive(:get_state)
    end
    it 'turns off when on' do
      allow(@switch).to receive(:is_on?).and_return(true)
      expect(@switch).to receive(:set_state!).with('0')
      @switch.turn_off!
    end
    it 'does not turn off when off' do
      allow(@switch).to receive(:is_off?).and_return(true)
      expect(@switch).not_to receive(:set_state!)
      @switch.turn_off!
    end
  end
end
