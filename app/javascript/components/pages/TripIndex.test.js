import React from 'react'
import Enzyme, { shallow } from 'enzyme'
import Adapter from 'enzyme-adapter-react-16'
import TripIndex from './TripIndex'
Enzyme.configure({ adapter: new Adapter() })

describe("When TripIndex renders", () => {
  it("displays a heading", () => {
    const tripIndex = shallow(<TripIndex />)
    const tripIndexHeading = tripIndex.find("h3")
    expect(tripIndexHeading.text()).toEqual("My Adventures")
  })
})
