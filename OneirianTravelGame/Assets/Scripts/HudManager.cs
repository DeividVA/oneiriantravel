using Assets.Scripts;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.TextCore.Text;
using UnityEngine.UI;

public class HudManager : MonoBehaviour
{

    private CanvasGroup _canvasGroup;
    public void ShowHud()
    {
        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 1f, 1f);
    }

    public void HideHud()
    {
        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 0f, 1f);
    }
}
