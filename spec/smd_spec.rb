require 'spec_helper'

describe SmD::SmD do

  describe "#initialize" do
    context "defaults" do
      its(:range){ is_expected.to be SmD::SmD::DEFAULT_RANGE }
      its(:ms_per_unit){ is_expected.to be SmD::SmD::MS_PER_HOUR }
    end

    context "with params" do
      it "accepts a range" do
        expect(SmD::SmD.new({ range: (2 ** 32) }).range).to eq (2 ** 32)
      end

      it "accepts milliseconds per unit" do
        expect(SmD::SmD.new({ ms_per_unit: 2000 }).ms_per_unit).to eq (2000)
      end
    end
  end

  describe "#range_in_ms" do
    its(:range_in_ms){ is_expected.to be_kind_of Integer }
    its(:range_in_ms){ is_expected.to eq (subject.range * subject.ms_per_unit) }
  end

  describe "#date" do
    it "should return a Time" do
      expect(subject.date(-1 * (2 ** 15))).to be_kind_of Time
    end

    it "should support negative values down to min" do
      expect(subject.date(-1 * (2 ** 15))).to eq Time.at(subject.min)
    end

    it "should support positive values up to max" do
      expect(subject.date((2 ** 16) - 1)).to eq Time.at(subject.max)
    end
  end

  describe "#min" do
    it "should be -1/2 the range" do
      expect(subject.min).to eq subject.date(-1 * (subject.range / 2))
    end
  end

  describe "#max" do
    it "should be one less than the range" do
      expect(subject.max).to eq subject.date(subject.range - 1)
    end
  end

  describe "#at" do
    it "supports negative numbers" do
      expect(subject.at(-1 * (2 ** 15))).to eq (subject.min.to_i * 1000)
    end
  end

  describe "#from" do
    it "should be less than the range" do
      expect(subject.from(Time.now.gmtime.to_i * 1000)).to be < subject.range
    end
  end

  describe "#now" do
    it "should be within one unit to Time.now" do
      at = subject.at subject.now
      time = (Time.now.gmtime.to_i * 1000)
      expect((time - at)).to be < subject.ms_per_unit
    end
  end
end
