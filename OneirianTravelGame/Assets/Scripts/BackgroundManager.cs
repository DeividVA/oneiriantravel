using Assets.Scripts;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BackgroundManager : MonoBehaviour
{

    private List<Background> _backgrounds;

    [SerializeField]
    private GameObject _backgroundPrefab;

    // Start is called before the first frame update
    void Start()
    {
        _backgrounds = new List<Background>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
