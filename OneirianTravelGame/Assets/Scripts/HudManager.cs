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

    [SerializeField]
    private float _fadeInTime = 1f;

    [SerializeField]
    private float _fadeOutTime = 1f;

    public void ShowHud()
    {
        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 1f, _fadeInTime);
    }

    public void HideHud()
    {
        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 0f, _fadeOutTime);
    }
}
