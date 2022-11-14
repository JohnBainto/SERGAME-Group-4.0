using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Text))]
public class TextButton : MonoBehaviour, IPointerClickHandler, IPointerDownHandler, IPointerUpHandler, IPointerEnterHandler, IPointerExitHandler
{
    // 
    public Color NormalColor = Color.black;
    public Color HoverColor = Color.black;
    public Color PressColor = Color.black;
    public Color DisabledColor = Color.gray;

    // add callbacks in the inspector like for buttons
    public UnityEvent onClick;

    private bool _isInteractive = true;
    public bool interactive
    {
        get
        { 
            return _isInteractive; 
        }
        set
        {
            _isInteractive = value;
            UpdateColor();
        }
    }

    private bool _isPressed;
    private bool _isHover;

    private Text _textComponent;
    private Text TextComponent
    {
        get
        {
            if(!_textComponent) _textComponent = GetComponent<Text>() ?? gameObject.AddComponent<Text>();

        }
    }

    private void Updatecolor()
    {
        if (!interactive)
        {
            TextComponent.color = DisabledColor;
            return;
        }

        if (isPressed)
        {
            TextComponent.color = PressColor;
            return;
        }

        if (isHover)
        {
            TextComponent.color = HoverColor;
            return;
        }

        TextComponent.color = NormalColor;
    }

    #region IPointer Callbacks

    public void OnPointerClick(PointerEventData pointerEventData)
    {
        //Output to console the clicked GameObject's name and the following message. You can replace this with your own actions for when clicking the GameObject.
        Debug.Log(name + " Word Clicked!", this);

        // invoke your event
        onClick.Invoke();
    }

    #endregion IPointer Callbacks
}
