//using Assets.Scripts;
//using System.Collections;
//using System.Collections.Generic;
//using UnityEditor.Search;
//using UnityEngine;
//using UnityEngine.UI;
//using UnityEngine.UIElements;

//public class Background : MonoBehaviour
//{

//    public BackgroundName Name { get; private set; }

//    public BackgroundSprite Sprite { get; private set; }

//    public bool IsShowing { get; private set; }

//    private float _offScreenX;

//    private float _onScreenX;

//    private readonly float _animationSpeed = 0.5f;

//    public void Init (BackgroundName name, BackgroundSprite sprite)
//    {
//        Name = name;

//        Show();
//    }

//    public void Show()
//    {

//        SetAnimationValues();

//        // Position outside of the screen
//        transform.position = new Vector3(_offScreenX, transform.position.y, transform.localPosition.z);

//        LeanTween.moveX(gameObject, _onScreenX, _animationSpeed).setEase(LeanTweenType.linear).setOnComplete(() =>
//        {
//            IsShowing = true;
//        });

//    }

//    public void Hide()
//    { 
//        LeanTween.moveX(gameObject, _offScreenX, _animationSpeed).setEase(LeanTweenType.linear).setOnComplete(() =>
//        {
//            IsShowing = false;
//        });
//    }

//    private void SetAnimationValues()
//    {
//        _onScreenX = Screen.width * 0.25f;
//        _offScreenX = -Screen.width * 0.25f;

//    }



//}
