const String getReservationPreferenceQuery = r'''
  query GetReservationPreference {
    getReservationPreference {
      bag {
        bag_id
        title
        image_url
      }
      drink {
        drink_id
        title
        image_url
        length
      }
      play {
        play_id
        title
        url
      }
      temperature {
        temperature_id
        title
        image_url
      }
      odor {
        odor_id
        title
        image_url
      }
    }
  }
''';

const String getReservationPreferenceTempOnlyQuery = r'''
  query GetReservationPreference {
    getReservationPreference {

      temperature {
        temperature_id
        title
        image_url
      }
     
    }
  }
''';

const String getReservationPreferenceDrinkOnlyQuery = r'''
  query GetReservationPreference {
    getReservationPreference {

      drink {
        drink_id
        title
        image_url
        length
      }

    }
  }
''';
const String getReservationPreferenceBagsOnlyQuery = r'''
  query GetReservationPreference {
    getReservationPreference {
      bag {
        bag_id
        title
        image_url
      }
 
     
    }
  }
''';
const String getReservationPreferencePlayOnlyQuery = r'''
  query GetReservationPreference {
    getReservationPreference {

      play {
        play_id
        title
        url
      }

    }
  }
''';
