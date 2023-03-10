require 'rspec'
require 'greek_names'

describe 'GreekNames' do
  describe '.vocative' do

    context 'names ending in "ας"' do
      it 'Should return Κώστα' do
        expect(GreekNames.vocative('Κώστας')).to eql('Κώστα')
      end
      it 'Should return ΑΝΔΡΕΑ' do
        expect(GreekNames.vocative('ΑΝΔΡΕΑΣ')).to eql('ΑΝΔΡΕΑ')
      end
    end

    context 'names ending in "ης"' do
      it 'Should return Αντώνη' do
        expect(GreekNames.vocative('Αντώνης')).to eql('Αντώνη')
      end
      it 'Should return ΔΗΜΗΤΡΗ' do
        expect(GreekNames.vocative('ΔΗΜΗΤΡΗΣ')).to eql('ΔΗΜΗΤΡΗ')
      end
    end

    context 'names ending in "ος|ός"' do
      it 'Should return Γιώργο' do
        expect(GreekNames.vocative('Γιώργος')).to eql('Γιώργο')
      end
      it 'Should return Κωνσταντίνε' do
        expect(GreekNames.vocative('Κωνσταντίνος')).to eql('Κωνσταντίνε')
      end
      it 'Should return Πάνο' do
        expect(GreekNames.vocative('Πάνος')).to eql('Πάνο')
      end
      it 'Should return Τοτό' do
        expect(GreekNames.vocative('Τοτός')).to eql('Τοτό')
      end
    end

    context 'female names' do
      it 'Should return Αγάπη' do
        expect(GreekNames.vocative('Αγάπη')).to eql('Αγάπη')
      end
      it 'Should return ΔΗΜΗΤΡΑ' do
        expect(GreekNames.vocative('ΔΗΜΗΤΡΑ')).to eql('ΔΗΜΗΤΡΑ')
      end
    end
  end

  describe '.genitive' do
    context 'male names' do
      context 'ending in ΑΣ' do
        it 'Should return ΚΩΣΤΑ' do
          expect( GreeNames.genitive('ΚΩΣΤΑΣ') ).to eql('ΚΩΣΤΑ')
        end
      end
      context 'ending in ΗΣ' do
        it 'Should return ΜΑΝΩΛΗ' do
          expect( GreeNames.genitive('ΜΑΝΩΛΗΣ') ).to eql('ΜΑΝΩΛΗ')
        end
      end
      context 'ending in ΟΣ' do
        it 'Should return ΠΑΝΟ' do
          expect( GreeNames.genitive('ΠΑΝΟΣ') ).to eql('ΠΑΝΟ')
        end
      end
      context 'ending in ΕΣ' do
      end
    end
    context 'female names' do
      context 'ending in Α' do
        it 'Should return ΑΝΝΑ' do
          expect( GreeNames.genitive('ΑΝΝΑ') ).to eql('ΑΝΝΑΣ')
        end
      end
      context 'ending in Η' do
        it 'Should return ΑΓΓΕΛΙΚΗ' do
          expect( GreeNames.genitive('ΑΓΓΕΛΙΚΗ') ).to eql('ΑΓΓΕΛΙΚΗΣ')
        end
      end
      context 'ending in Ο' do
        it 'Should return ' do
          expect( GreeNames.genitive('ΚΩΣΤΑΣ') ).to eql('ΚΩΣΤΑ')
        end
      end
      context 'ending in Υ' do
        it 'Should return ' do
          expect( GreeNames.genitive('ΚΩΣΤΑΣ') ).to eql('ΚΩΣΤΑ')
        end
      end
      context 'ending in Ω' do
        it 'Should return ΗΡΩ' do
          expect( GreeNames.genitive('ΗΡΩ') ).to eql('ΗΡΟΥΣ')
        end
      end
      context 'ending in Σ' do
        it 'Should return ΑΡΤΕΜΙΣ' do
          expect( GreeNames.genitive('ΑΡΤΕΜΙΣ') ).to eql('ΚΩΣΤΑ')
        end
      end
    end
  end

  describe '.accusative' do
  end
end
