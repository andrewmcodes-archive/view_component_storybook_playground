class ButtonComponentPreview < ViewComponent::Preview
  def with_short_text
    render(ButtonComponent.new(text: "Button"))
  end

  def with_long_text
    render(ButtonComponent.new(text: "Button with Long Text"))
  end
end
