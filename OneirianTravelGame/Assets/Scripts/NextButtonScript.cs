using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NextButtonScript : MonoBehaviour
{
    private InkManager _inkManager;

    private CTManager _ctManager;

    // Start is called before the first frame update
    void Start()
    {
        _inkManager = FindObjectOfType<InkManager>();

        if (_inkManager == null) 
        {
            Debug.LogError("Ink Manager was not found!");
        
        }
        //Observer();

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnClick()
    {
        _inkManager?.DisplayNextLine();


    }

    //private void Observer()
    //{
    //    if (_ctManager._blockedNext)
    //    {
    //        Debug.Log("hola");
    //    }
    //}

}
