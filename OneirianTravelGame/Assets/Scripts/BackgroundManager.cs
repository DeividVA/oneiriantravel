using Assets.Scripts;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.TextCore.Text;
using UnityEngine.UI;
//using UnityEngine.UIElements;

public class BackgroundManager : MonoBehaviour
{

    //private List<Background> _backgrounds;

    [SerializeField]
    private GameObject _backgroundPrefab;

    [SerializeField]
    private Sprite _streetsSprite;

    [SerializeField]
    private Sprite _alleySprite;

    [SerializeField]
    private Sprite _districtSprite;

    [SerializeField]
    private Sprite _restaurantSprite;

    [SerializeField]
    private Sprite _templeSprite;

    [SerializeField]
    private Sprite _shrineSprite;

    [SerializeField]
    private Sprite _preludeSprite;

    [SerializeField]
    private Sprite _epilogueSprite;

    private CanvasGroup bgCanvas;

    [SerializeField]
    private float _fadeInTime = 1f;

    [SerializeField]
    private float _fadeOutTime = 1f;

    public void ShowBackground(string name)
    {
        if (!Enum.TryParse(name, out BackgroundName nameEnum))
        {
            Debug.LogWarning($"Failed to parse background name to enum: {name}");
            return;
        }

        ShowBackground(nameEnum);
    }

    public void ShowBackground(BackgroundName name)
    {

        var backgroundObject = Instantiate(_backgroundPrefab, gameObject.transform, false);
        
        var backgroundImage = backgroundObject.GetComponent<Image>();

        bgCanvas = backgroundObject.GetComponent<CanvasGroup>();

        //backgroundImage.sprite = Resources.Load<Sprite>($"Backgrounds/{name}");
        backgroundImage.sprite = GetSpriteForBackground(name);

        LeanTween.alphaCanvas(bgCanvas, 1f, _fadeInTime);
    }

    public void HideBackground(string name)
    {
        if (!Enum.TryParse(name, out BackgroundName nameEnum))
        {
            Debug.LogWarning($"Failed to parse background name to enum: {name}");
            return;
        }

        HideBackground(nameEnum);
    }

    public void HideBackground(BackgroundName name)
    {
        var actualBackground = GameObject.FindGameObjectWithTag("Background");

        bgCanvas = actualBackground.GetComponent<CanvasGroup>();

        LeanTween.alphaCanvas(bgCanvas, 0f, _fadeOutTime);

        Destroy(actualBackground, 2f);
        
        //var backgroundImage = actualBackground.GetComponent<Image>();

        //backgroundImage.sprite = null;

    }

    private Sprite GetSpriteForBackground(BackgroundName name)
    {
        switch (name)
        {
            case BackgroundName.Streets:
                return _streetsSprite;
            case BackgroundName.Alley:
                return _alleySprite;
            case BackgroundName.District:
                return _districtSprite;
            case BackgroundName.Restaurant:
                return _restaurantSprite;
            case BackgroundName.Temple:
                return _templeSprite;
            case BackgroundName.Shrine:
                return _shrineSprite;
            case BackgroundName.Prelude:
                return _preludeSprite;
            case BackgroundName.Epilogue:
                return _epilogueSprite;
            default:
                Debug.LogError($"Could not find sprite for {name}");
                return null;
        }
    }


}
