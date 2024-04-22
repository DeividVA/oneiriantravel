using Assets.Scripts;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.TextCore.Text;
using UnityEngine.UI;

public class ItemManager : MonoBehaviour
{
    [SerializeField]
    private GameObject _itemPrefab;

    [SerializeField]
    private Sprite _oldClockSprite;

    [SerializeField]
    private Sprite _dogClockSprite;

    [SerializeField]
    private Sprite _catClockSprite;

    [SerializeField]
    private Sprite _mouseClockSprite;

    [SerializeField]
    private Sprite _dictionarySprite;

    [SerializeField]
    private Sprite _allDrawingsSprite;

    [SerializeField]
    private Sprite _classDrawingSprite;

    [SerializeField]
    private Sprite _ballDrawingSprite;

    [SerializeField]
    private Sprite _beachDrawingSprite;

    private GameObject itemObject;
    private Image itemImage;
    private CanvasGroup itemCanvas; 


    public void ShowItem(string name)
    {
        if (!Enum.TryParse(name, out ItemName nameEnum))
        {
            Debug.LogWarning($"Failed to parse item name to enum: {name}");
            return;
        }

        ShowItem(nameEnum);
    }

    public void ShowItem(ItemName name)
    {

        itemObject = Instantiate(_itemPrefab, gameObject.transform, false);
        itemImage = itemObject.GetComponent<Image>();
        itemCanvas = itemObject.GetComponent<CanvasGroup>();
        //itemImage.color = new Color (255,255,255,0);

        itemImage.sprite = GetSpriteForItem(name);

        LeanTween.alphaCanvas(itemCanvas, 1f, 1f);

        //LeanTween.alpha(itemObject, 1f, 1f).setDelay(5f);
    }

    public void HideItem()
    {
        var showingItem = GameObject.FindGameObjectWithTag("Item");
        itemCanvas = itemObject.GetComponent<CanvasGroup>();

        LeanTween.alphaCanvas(itemCanvas, 0f, 1f);

        Destroy(showingItem, 5f);

    }

    private Sprite GetSpriteForItem(ItemName name)
    {
        switch (name)
        {
            case ItemName.OldClock:
                return _oldClockSprite;
            case ItemName.DogClock:
                return _dogClockSprite;
            case ItemName.CatClock:
                return _catClockSprite;
            case ItemName.MouseClock:
                return _mouseClockSprite;
            case ItemName.Dictionary:
                return _dictionarySprite;
            case ItemName.Drawings:
                return _allDrawingsSprite;
            case ItemName.ClassDrawing:
                return _classDrawingSprite;
            case ItemName.BallDrawing:
                return _ballDrawingSprite;
            case ItemName.BeachDrawing:
                return _beachDrawingSprite;
            default:
                Debug.LogError($"Could not find sprite for {name}");
                return null;
        }
    }

}