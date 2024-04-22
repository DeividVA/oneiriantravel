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

        //backgroundImage.sprite = Resources.Load<Sprite>($"Backgrounds/{name}");
        backgroundImage.sprite = GetSpriteForBackground(name);

        LeanTween.alpha(backgroundObject, 1f, 1f).setDelay(500000f);
    }

    //public void HideBackground(string name)
    //{
    //    if (!Enum.TryParse(name, out BackgroundName nameEnum))
    //    {
    //        Debug.LogWarning($"Failed to parse background name to enum: {name}");
    //        return;
    //    }

    //    HideBackground(nameEnum);
    //}

    public void HideBackground()
    {
        var actualBackground = GameObject.FindGameObjectWithTag("Background");
        Destroy(actualBackground);
        
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
            default:
                Debug.LogError($"Could not find sprite for {name}");
                return null;
        }
    }


}
