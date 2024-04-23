using Assets.Scripts;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.TextCore.Text;
using UnityEngine.UI;

public class CTManager : MonoBehaviour
{

    private CanvasGroup _canvasGroup;

    private int _currentChapter = 1;

    [SerializeField]
    private List<String> _titleList;

    [SerializeField]
    private GameObject _imageCT;

    //public bool _blockedNext;

    [SerializeField]
    private float _fadeInTime = 1f;

    [SerializeField]
    private float _fadeOutTime = 1f;

    [SerializeField]
    private float _fadeInText = 1f;


    public void ShowCT()
    {

        //var _imageCT = GameObject.FindGameObjectWithTag("ImageCT");
        _imageCT.SetActive(true);
        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 1f, _fadeInTime);

        ShowText(_currentChapter, _titleList[_currentChapter-1]);
        //_blockedNext = true;
    }

    public void HideCT()
    {


        _canvasGroup = GetComponent<CanvasGroup>();
        LeanTween.alphaCanvas(_canvasGroup, 0f, _fadeOutTime);
        _imageCT.SetActive(false);
        //_blockedNext = false;



    }

    private int ShowText(int chapter, string title)
    {
        //Chapter
        var _chapterObject = GameObject.FindGameObjectWithTag("Chapter");
        var _chapterCanvas = _chapterObject.GetComponent<CanvasGroup>();
        var _chapterText = _chapterObject.GetComponent<TextMeshProUGUI>();

        _chapterText.text = $"Capítulo {chapter}";
        LeanTween.alphaCanvas(_chapterCanvas, 1f, _fadeInText);

        //Title
        var _titleObject = GameObject.FindGameObjectWithTag("Title");
        var _titleCanvas = _titleObject.GetComponent<CanvasGroup>();
        var _titleCont = _titleObject.GetComponent<TextMeshProUGUI>();
        
        _titleCont.text = title.ToString();
        LeanTween.alphaCanvas(_titleCanvas, 1f, _fadeInText);


        return _currentChapter++;
    }
}