class ButtonComponentStories < ViewComponent::Storybook::Stories
  layout "storybook"

  story(:with_short_text) do
    knobs do
      text(:text, 'OK')
    end
  end

  story(:with_long_text) do
    knobs do
      text(:text, 'Push Me Please!')
    end
  end
end
