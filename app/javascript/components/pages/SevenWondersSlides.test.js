import React from 'react'
import Enzyme, { shallow } from 'enzyme'
import Adapter from 'enzyme-adapter-react-16'
import SevenWondersSlides from './SevenWondersSlides'
Enzyme.configure({ adapter: new Adapter() })

describe("When SevenWonders renders", () => {
    let sevenWondersRender

    beforeEach(()=> {
        sevenWondersRender = shallow(<SevenWondersSlides />)
    })

  // it("displays a heading", () => {
  //   const sevenWondersRenderHeading = sevenWondersRender.find("h3")
  //   expect(sevenWondersRenderHeading.text()).toEqual("Seven Wonders of the World")
  // })

  it("displays 7 items, one for each wonder", () => {
    const sevenWondersCards = sevenWondersRender.find("CarouselItem")
    expect(sevenWondersCards.length).toEqual(7)
  })
})