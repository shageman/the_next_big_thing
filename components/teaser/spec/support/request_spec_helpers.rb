module RequestSpecHelpers
  def press_key_on_selector(key, selector)
    page.driver.execute_script("var e = $.Event('keydown', { keyCode: #{key} }); $('#{selector}').trigger(e);")
  end
end